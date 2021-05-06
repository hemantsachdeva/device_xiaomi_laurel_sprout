CL_YLW="\033[1;33m"
CL_GRN="\033[1;32m"
CL_CYN="\033[1;36m"
CL_RST="\033[0m"

if [ ! -d prebuilts/clang/host/linux-x86/clang-proton ]; then
  echo -e ${CL_YLW}"Proton clang toolchain to build kernel not found..!"${CL_RST}
  read -rp "Want to clone with depth=1? Size around 4GB [y|n]: " choice

  case ${choice} in
  Y | y) echo -e ${CL_CYN}"Ohkay Clonning..!"${CL_RST} && git clone https://github.com/HemantSachdeva/proton-clang --single-branch -b master --depth=1 prebuilts/clang/host/linux-x86/clang-proton ;;
  N | n) echo -e ${CL_GRN}"As you wish! (You may get build errors then)"${CL_RST} ;;
  esac
fi

# Hals
if [ -d vendor/qcom/opensource/commonsys-intf/display/services ]; then
  cd vendor/qcom/opensource/ && rm -rf commonsys-intf/display/
  git clone https://github.com/EvolutionX-laurel/vendor_qcom_opensource_display-commonsys-intf/ commonsys-intf/display/
  cd wfd-commonsys/  # Add remote from https://github.com/EvolutionX-laurel/vendor_qcom_opensource_wfd-commonsys
  git cherry-pick 9f11a5cfde93f70a0534d146c09c3f1c8683185a
  cd ../../../../
fi