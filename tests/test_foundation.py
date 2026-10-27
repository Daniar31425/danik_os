"""Portable contract checks; ISO/hardware acceptance is separate."""
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]


class FoundationTests(unittest.TestCase):
    def test_required_deliverables(self):
        for name in ('AGENTS.md', 'README.md', 'SECURITY.md', 'CONTRIBUTING.md',
                     'LICENSE', 'docs/BUILD.md', 'docs/ARCHITECTURE.md',
                     'docs/REQUIREMENTS.md', 'docs/ROADMAP.md',
                     'docs/HARDWARE_SUPPORT.md', 'iso/profile/profiledef.append.sh',
                     'scripts/build-iso.sh', 'scripts/verify-iso.sh', 'scripts/run-vm.sh'):
            with self.subTest(path=name):
                self.assertTrue((ROOT / name).is_file(), name)

    def test_shell_files_are_portable_text(self):
        for path in list((ROOT / 'scripts').glob('*.sh')) + list((ROOT / 'iso').rglob('*.sh')):
            with self.subTest(path=path.name):
                data = path.read_bytes()
                self.assertNotIn(b'\r', data)
                self.assertFalse(data.startswith(b'\xef\xbb\xbf'))


if __name__ == '__main__':
    unittest.main()
