# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KDE_SCM="git"
inherit kde4-base

DESCRIPTION="KDE library for CDDB"
KEYWORDS=""
IUSE="debug musicbrainz"

# tests require network access and compare static data with online data
# bug 280996
RESTRICT=test

DEPEND="
	musicbrainz? ( media-libs/musicbrainz:3 )
"
RDEPEND="${DEPEND}"

KMSAVELIBS="true"

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_with musicbrainz MusicBrainz3)
	)

	kde4-base_src_configure
}
