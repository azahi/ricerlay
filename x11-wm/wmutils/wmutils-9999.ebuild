# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/wmutils/core.git"
fi

DESCRIPTION="Set of window manipulation tools"
HOMEPAGE="https://github.com/wmutils/core"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/wmutils/core/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="ISC"
SLOT="0"
IUSE=""

DEPEND="
	x11-libs/libxcb
	x11-libs/xcb-util
	x11-libs/xcb-util-cursor
"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=(README.md)

if [[ ${PV} != *9999 ]]; then
	S="${WORKDIR}/core-${PV}"
fi

src_prepare() {
	sed -i 's/-Os//g' -i config.mk
	default
}

src_install() {
	emake DESTDIR="${D}" MANPREFIX="${EPREFIX}/usr/share/man" install
	einstalldocs
}
