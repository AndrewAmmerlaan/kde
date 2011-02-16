# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

KMNAME="kdebase-apps"
inherit kde4-meta

DESCRIPTION="Various plugins for konqueror"
HOMEPAGE="http://kde.org/"

LICENSE="GPL-2"
KEYWORDS=""
SLOT="4"
IUSE="debug tidy"

DEPEND="
	>=kde-base/libkonq-${KDE_MINIMAL}
	tidy? ( app-text/htmltidy )
"
RDEPEND="${DEPEND}
	!kde-base/konq-plugins:4.1[-kdeprefix]
	!kde-base/konq-plugins:4.2[-kdeprefix]
	>=kde-base/kcmshell-${KDE_MINIMAL}
	>=kde-base/konqueror-${KDE_MINIMAL}
"

src_configure() {
	mycmakeargs=(
		-DKdeWebKit=OFF
		-DWebKitPart=OFF
		$(cmake-utils_use_with tidy LibTidy)
	)

	kde4-meta_src_configure
}
