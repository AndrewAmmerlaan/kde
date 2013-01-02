# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit font git-2

DESCRIPTION="Desktop/GUI font family for integrated use with the KDE desktop"
HOMEPAGE="https://projects.kde.org/projects/playground/artwork/oxygen-fonts"
EGIT_REPO_URI="git://anongit.kde.org/oxygen-fonts"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS=""
IUSE=""

src_install() {
	FONTS="Bold Extra-Light Mono Regular"
	FONT_SUFFIX="ttf sfd"

	for f in ${FONTS} ; do
		FONT_S="${S}/in-progress/${f}" font_src_install
	done
}
