# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# needed for digikam
KDE_OVERRIDE_MINIMAL="4.9.0"

inherit kde4-base

DESCRIPTION="KDE digital camera raw image library wrapper"
KEYWORDS=""
IUSE="debug"

DEPEND="
	media-libs/lcms:0
	virtual/jpeg
"
RDEPEND="${DEPEND}"
