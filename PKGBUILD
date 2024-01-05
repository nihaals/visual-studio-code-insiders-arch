pkgname=visual-studio-code-insiders
_pkgbuildnumber=1703050604
_pkgversion=1.86.0_insider
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

_main_desktop_sha256='acff0a89299c65b70bae82925627a885c16ff13910e1d1e9b791146e0a599306'
_url_handler_desktop_sha256='0af52e8fb02b9777ee9736ed9ff38eb4cac3f2e9687f21f5fce49d215d38bbe1'
_wrapper_script_sha256='a0ae0c3b3a304c95c996cc09d0ca7693498aa82d3544f13d0ee7b5a0b7aac17f'
sha256sums_x86_64=(
  '88bae2324f7b4ad97f710ae4efb8afd9ab55fb2916e11b530af922279a8b103d'
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

