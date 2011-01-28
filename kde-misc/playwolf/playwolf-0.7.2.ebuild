# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit kde4-base

MY_P="${PN}"

DESCRIPTION="KDE4 plasmoid. Controller and visualizer of information about the songs for amarok 2.0."
HOMEPAGE="http://www.kde-look.org/content/show.php/PlayWolf?content=93882"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.bz2"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="debug"

RDEPEND="
	!kde-plasmoids/playwolf
	>=kde-base/kdelibs-${KDE_MINIMAL}[semantic-desktop]
	>=kde-base/plasma-workspace-${KDE_MINIMAL}
"

S="${WORKDIR}/${MY_P}"
