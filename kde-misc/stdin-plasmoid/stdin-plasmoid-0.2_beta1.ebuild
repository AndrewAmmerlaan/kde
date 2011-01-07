# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit kde4-base versionator

MY_P="$(replace_version_separator 2 '-')"

DESCRIPTION="KDE4 plasmoid for executing a process and captures its stderr and stdout."
HOMEPAGE="http://www.kde-look.org/content/show.php/STDIN+Plasmoid?content=92309"
SRC_URI="http://www.kde-look.org/CONTENT/content-files/92309-${MY_P}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="debug"

RDEPEND="
	!kde-plasmoids/stdin-plasmoid
	>=kde-base/plasma-workspace-${KDE_MINIMAL}
"

S="${WORKDIR}/${MY_P}"
