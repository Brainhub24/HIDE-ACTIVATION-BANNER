import subprocess
import unittest

""" TEST
"""

class BatchScriptTestCase(unittest.TestCase):
    def test_script_runs_without_errors(self):
        # Run the batch script
        completed_process = subprocess.run(['path/to/your/batch_script.bat'], shell=True)
        
        # Check the return code of the process
        self.assertEqual(completed_process.returncode, 0)

if __name__ == '__main__':
    unittest.main()
