# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

KDE_HANDBOOK=1
KMNAME="kdeedu"
inherit kde4-meta

DESCRIPTION="KDE4 interface to work with Graph Theory"
KEYWORDS=""
IUSE="debug"

DEPEND="
	>=dev-cpp/eigen-2.0.3:2
"
RDEPEND=""
