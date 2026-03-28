import os

QMK = os.path.expanduser("~/qmk_firmware")
REPO = os.path.dirname(os.path.abspath(__file__))

os.symlink(f"{REPO}/users/will-sval", f"{QMK}/users/will-sval")
os.symlink(f"{REPO}/keyboards/svalboard/keymaps/will-sval", f"{QMK}/keyboards/svalboard/keymaps/will-sval")
