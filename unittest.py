import logging
import unittest
import datetime
import platform
import subprocess

"""
    When running the test script, it will execute the batch script and verify that it completes without any errors. If the batch script encounters an error, the test will fail.
"""

class BatchScriptTestCase(unittest.TestCase):
    def setUp(self):
        # Set up logging
        timestamp = datetime.datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
        log_filename = f'test_log_{timestamp}.txt'
        logging.basicConfig(filename=log_filename, level=logging.INFO)
        logging.info(f'Test started at {timestamp}')
        logging.info(f'Operating System: {platform.system()} {platform.release()}')

    def tearDown(self):
        logging.info('Test completed.')

    def test_script_runs_without_errors(self):
        # Run the batch script
        completed_process = subprocess.run(['activation.bat'], shell=True)
        
        # Check the return code of the process
        self.assertEqual(completed_process.returncode, 0)
        logging.info('Script executed successfully.')

if __name__ == '__main__':
    unittest.main()
