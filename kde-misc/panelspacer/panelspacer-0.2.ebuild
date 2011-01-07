# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit kde4-base

MY_P="Panelspacer_from_svn_pour_kdelook-tmp"

DESCRIPTION="KDE4 plasmoid. Lets you put some blank space between the other applets located in a panel"
HOMEPAGE="http://www.kde-look.org/content/show.php/Panel+Spacer?content=89304"
SRC_URI="http://danakil.free.fr/linux/releases/${P}/${PN}-plasmoid-${PV}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="debug"

RDEPEND="
	!kde-plasmoids/panelspacer
	>=kde-base/plasma-workspace-${KDE_MINIMAL}
"

S="${WORKDIR}/${MY_P}"

PATCHES=( "${FILESDIR}/cmake_fix_for_kde-4_2.patch" )
