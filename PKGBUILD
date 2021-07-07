pkgname=visual-studio-code-insiders
_pkgbuildnumber=1625608150
_pkgversion=1.58.0_insider
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
)

_main_desktop_sha256='edfeb13aa50d35fbae748ff545b5bd126be916dbfeda682157e3d5ce81574db2'
_url_handler_desktop_sha256='d06d9d057b507d1747a8ed8ae304beb5e20c7bf887c362c941d85b02c893069e'
sha256sums_x86_64=(
  '2be116c0b8fa0ffde1be3ef0cb7451824777b2ffdc0ff9b823c3aa5d756d471d'
  "${_main_desktop_sha256}"
  "${_url_handler_desktop_sha256}"
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
  ln -s "/opt/${pkgname}/bin/code-insiders" "${pkgdir}/usr/bin/code-insiders"
}
