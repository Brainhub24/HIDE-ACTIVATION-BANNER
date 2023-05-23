import subprocess
import unittest

"""
    When running the test script, it will execute the batch script and verify that it completes without any errors. If the batch script encounters an error, the test will fail.
"""

class BatchScriptTestCase(unittest.TestCase):
    def test_script_runs_without_errors(self):
        # Run the batch script
        completed_process = subprocess.run(['activation.bat'], shell=True)
        
        # Check the return code of the process
        self.assertEqual(completed_process.returncode, 0)

if __name__ == '__main__':
    unittest.main()
