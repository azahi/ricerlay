# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://www.uninformativ.de/git/xlocatemouse.git"
fi

DESCRIPTION="Find your X11 mouse pointer"
HOMEPAGE="https://www.uninformativ.de/git/xlocatemouse/file/README.html"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://www.uninformativ.de/git/xlocatemouse/archives/xlocatemouse-v${PV}.tar.gz -> ${PN}-v${PV}.tar.gz"
	S="${WORKDIR}/${PN}-v${PV}"  # xlocatemouse-v20.05 is used in source tarball
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

PATCHES=(
	"${FILESDIR}/${P}-makefile.patch"
)

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
}
