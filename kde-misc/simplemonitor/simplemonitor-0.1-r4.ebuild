# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit kde4-base

DESCRIPTION="KDE4 plasmoid. A simple and compact system monitor."
HOMEPAGE="http://kde-look.org/content/show.php/Simple+monitor?content=84933"
SRC_URI="http://kde-look.org/CONTENT/content-files/84933-${PN}.tar.gz"

RESTRICT="mirror"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="debug"

RDEPEND="
	!kde-plasmoids/simplemonitor-plasmoid
	>=kde-base/plasma-workspace-${KDE_MINIMAL}
"

S="${WORKDIR}/${PN}"

src_prepare() {
	# Follow naming convention
	sed -i 's/DESTINATION \${SERVICES_INSTALL_DIR}/\0 RENAME plasma-applet-simplemonitor.desktop/' \
		CMakeLists.txt || die "sed failed"

	kde4-base_src_prepare
}
