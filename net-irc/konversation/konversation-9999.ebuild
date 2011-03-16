# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

KDE_SCM="git"
inherit kde4-base

DESCRIPTION="A user friendly IRC Client for KDE4"
HOMEPAGE="http://konversation.kde.org"

LICENSE="GPL-2"
KEYWORDS=""
SLOT="4"
IUSE="+crypt debug"

DEPEND="
	$(add_kdebase_dep kdepimlibs)
	crypt? ( app-crypt/qca:2 )
"
RDEPEND="${DEPEND}
	crypt? ( app-crypt/qca-ossl )
"

src_configure() {
	mycmakeargs=($(cmake-utils_use_with crypt QCA2))
	kde4-base_src_configure
}
