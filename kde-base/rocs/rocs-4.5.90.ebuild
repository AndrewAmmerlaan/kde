# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

KDE_HANDBOOK="optional"
KMNAME="kdeedu"
inherit kde4-meta

DESCRIPTION="KDE4 interface to work with Graph Theory"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="
	>=dev-cpp/eigen-2.0.3:2
"
RDEPEND=""
