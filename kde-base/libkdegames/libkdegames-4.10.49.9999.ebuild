# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit kde4-base

DESCRIPTION="Base library common to many KDE games."
KEYWORDS=""
IUSE="debug openal"

DEPEND="
	openal? (
		media-libs/libsndfile
		media-libs/openal
	)
"
RDEPEND="${DEPEND}"

KMSAVELIBS="true"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use openal USE_OPENAL_SNDFILE)
	)

	kde4-base_src_configure
}
