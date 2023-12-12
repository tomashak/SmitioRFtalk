import csv
from robot.libraries.BuiltIn import BuiltIn

class TestStepsListener:

    ROBOT_LISTENER_API_VERSION = 2
    ROBOT_LIBRARY_SCOPE = "GLOBAL"
    previous_ID = 0

    def __init__(self):
        self.csv_file = open('keyword_execution_log.csv', 'w', newline='', encoding='utf-8')
        self.csv_writer = csv.writer(self.csv_file)
        self.csv_writer.writerow(['ID','Priority','Name', 'Description' , 'Test Steps.Action', 'Arguments', 'Test Steps.Expected result'])

    def start_test(self, name, attributes):
        self.test_name = attributes['longname']
        #suite_name = attributes['suitelongname']
        self.doc = attributes['doc']
        tags = attributes['tags']
        for tag in tags:
            if "CB" in tag:
                self.CB_ID = tag.split(':')[1]
        print(f"*** ID: {self.CB_ID}, Test Name: {self.test_name}, Documentation: {self.doc} ")

    def end_test(self, name, attributes):
        pass

    def start_keyword(self, name, attributes):
        args = attributes['args']
        print(f"--- Keyword: {name}, Arguments: {args}")
        if (self.previous_ID == 0) or (self.previous_ID != self.CB_ID):
            self.csv_writer.writerow([self.CB_ID,'normal',self.test_name, self.doc  , name, args, 'PASS: / FAIL:'])
        else:  #for next rows with keywords for the same TC
            self.csv_writer.writerow(['','','','', name, args, 'PASS: / FAIL:'])
        self.previous_ID = self.CB_ID

    def end_keyword(self, name, attributes):
        pass

    def start_suite(self, name, attributes):
        self.current_suite = name
        self.current_suite_doc = attributes['doc']
        print(f"xxx Suite Name: {self.current_suite}")
        self.csv_writer.writerow(['ID of suite','high',self.current_suite, self.current_suite_doc  , '-', '-', '-'])  

    def end_suite(self, name, attributes):
        self.csv_file.close()