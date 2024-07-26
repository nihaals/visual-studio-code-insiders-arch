pkgname=visual-studio-code-insiders
_pkgbuildnumber=1722002452
_pkgversion=1.92.0_insider
pkgver="${_pkgversion}+${_pkgbuildnumber}"
pkgrel=1
pkgdesc="Editor for building and debugging modern web and cloud applications (insiders version)"
arch=('x86_64')
url="https://code.visualstudio.com/"
license=('custom: commercial')
depends=(
  'libxkbfile'
  'gnupg'
  'gtk3'
  'libsecret'
  'nss'
  'gcc-libs'
  'libnotify'
  'libxss'
  'glibc'
  'lsof' # terminal splitting, see https://github.com/Microsoft/vscode/issues/62991
)
optdepends=(
  "glib2: Needed for move to trash functionality"
  "libdbusmenu-glib: Needed for KDE global menu"
)

_src_x86_64="https://update.code.visualstudio.com/latest/linux-x64/insider"
source_x86_64=(
  "code_insider_x64_${_pkgbuildnumber}.tar.gz::${_src_x86_64}"
  "${pkgname}.desktop"
  "${pkgname}-url-handler.desktop"
  "${pkgname}.sh"
)

_main_desktop_sha256='b32380762e4931825c11a46a7a08b928d603fdd6db5ec31c7b29982453f67cbd'
_url_handler_desktop_sha256='0af52e8fb02b9777ee9736ed9ff38eb4cac3f2e9687f21f5fce49d215d38bbe1'
_wrapper_script_sha256='a1b05c4dbab7167b09cb8f9d680600b3f517dea6c3696ac9d84f1566f70c4b8d'
sha256sums_x86_64=(
  'aefbe9e2eee80bbec7e7383fbbc2afe3864d360fd0dc68d8648b3e90ff9b0e80'
  "${_main_desktop_sha256}"
  "${_url_handler_desktop_sha256}"
  "${_wrapper_script_sha256}"
)

package() {
  _pkg=VSCode-linux-x64

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons"

  install -m644 "${srcdir}/${_pkg}/resources/app/LICENSE.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rtf"
  install -m644 "${srcdir}/${_pkg}/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -m644 "${srcdir}/${pkgname}-url-handler.desktop" "${pkgdir}/usr/share/applications/${pkgname}-url-handler.desktop"

  cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${pkgname}" -R
  install -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/code-insiders"
}
