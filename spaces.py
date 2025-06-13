
import sqlite3
import argparse
import subprocess

import time  # Make sure to import time if you're using it
from rich.console import Console
from rich.table import Table
import random

import os

class Spaces:

    def __init__(self):
        # self.name = name
        self.console = Console()

        ################################################################ database
    def create_db(self, cursor):
        # space table
        cursor.execute(
            """
            CREATE TABLE IF NOT EXISTS spaces(
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                space_name TEXT NOT NULL ,
                UNIQUE(space_name)
            );
            """
        )
        # main table
        cursor.execute(
            """
            CREATE TABLE IF NOT EXISTS items(
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                space_id INTEGER,
                app TEXT,
                workspace INTEGER ,
                FOREIGN KEY (space_id) REFERENCES spaces(id)
            );
            """
        )

    def new_record_workspace(self, cursor, spacename):
        cursor.execute(
            """
            INSERT OR IGNORE INTO spaces (space_name) VALUES (?);
            """,
            (spacename,)
        )

    def new_record_item(self, cursor, space_name, app, session):
        workspace_id = self.read_space_id_by_name(cursor,space_name)
        cursor.execute(
            """
            INSERT OR IGNORE INTO items (space_id , app , workspace) VALUES (?,?,?);
            """,
            (workspace_id, app, session)
        )

    def read_all_workspaces(self , cursor):
        spaces = cursor.execute(
            """
            SELECT * From spaces
            """
        )
        spaces = cursor.fetchall()
        return spaces

    def read_all_workspace_items(self, cursor, workspace):
        # Get space by name
        cursor.execute(
            """
            SELECT * FROM spaces WHERE space_name = (?)
            """,
            (workspace,)
        )
        space = cursor.fetchall()  

        if space is None:
            return []  


        cursor.execute(
            """
            SELECT * FROM items WHERE space_id = (?)
            """,
            (space[0][0],)  
        )
        results = None
        results = cursor.fetchall()  
        if not results:
            return None

        return results


    def read_space_id_by_name(self, cursor, workspace ) :
        cursor.execute(
            """
            SELECT * FROM spaces WHERE space_name = (?) 
            """,
            (workspace,)

        )

        result = cursor.fetchone()
        return result[0] if result else None  # Return the ID or None if not found



    def delete_item(self , cursor , workspace, app ,session) :

        workspace_id = self.read_space_id_by_name(cursor,workspace)
        workspace_items = self.read_all_workspace_items(cursor,workspace)
        print (workspace_items)
        print(workspace_id)
        for workspace in workspace_items :
            if (workspace[1] == workspace_id) and (workspace[2] == app) and (workspace[3] == session):
                cursor.execute(
                """
                DELETE from items WHERE id = (?) 
                """ , (workspace[0],)
                )


    def delete_all_items_by_workspace(self,cursor,workspace):
        workspace_id = self.read_space_id_by_name(cursor,workspace)
        cursor.execute(
            """
            DELETE from items WHERE space_id = (?) 
            """ , (workspace_id ,)
            )

    def delete_a_workspace(self , cursor , workspace):
        self.delete_all_items_by_workspace(cursor,workspace)
        workspace_id = self.read_space_id_by_name(cursor,workspace)
        cursor.execute(
            """
            DELETE from spaces WHERE id = (?) 
            """ , (workspace_id , )
            )


        #####################################################################################

        ############################################################################### rich

    def create_table_items(self, name, spaces):
        # Create a table
        table = Table(title="workspace: " + name)

        # Add columns
        table.add_column("ID", justify="center", style="cyan", no_wrap=True)
        table.add_column("app_name", justify="left", style="magenta")
        table.add_column("session", justify="right", style="green")

        if spaces:
            
            for space in spaces:
                table.add_row(str(space[0]), str(space[2]), str(space[3]))

        self.console.print(table)  

    def create_table_workspaces(self, workspaces):
        # Create a table
        table = Table(title="List of workspaces => ")

        # Add columns
        table.add_column("ID", justify="left", style="cyan", no_wrap=True)
        table.add_column("workspace", justify="right", style="magenta")

        if workspaces :

            for workspace in workspaces:
                table.add_row(str(workspace[0]),str(workspace[1]))

        self.console.print(table)  

        ####################################################################

        ############################################################## args

    def make_ARGS(self):
        parser = argparse.ArgumentParser(description="This tool helps you make spaces and open apps on startup for work - programming - etc...")
        
        parser.add_argument("-m", "--make", type=str, help="Make a new space and name it. Usage: -m [name]")
        parser.add_argument("-rs", "--read_workspace", action="store_true", help="List all available workspaces")

        # -ai workspace_name app_name desktop_session
        parser.add_argument("-ai", "--add_item", type=str, nargs='+' , help="Make a new app on that space and name it. Usage: -ai [workspace_name] [app_name] [desktop_session] ")
     
       # -ri workspace_name app_name desktop_session
        parser.add_argument("-rmi", "--remove_item", type=str, nargs='+' , help="remove an app from your workspace. Usage: -ri [workspace_name] [app_name] [desktop_session] ")
       
       # -rw workspace_name 
        parser.add_argument("-rmw", "--remove_workspace", type=str , help="remove a workspace compeletly. Usage: -rw [workspace_name] ")

        parser.add_argument("-ri3", "--run_i3", type=str, help="run a workspace on i3wm. Usage: -r [workspace_name]")

        parser.add_argument("-xp", "--xprop", action="store_true", help="uses xprop to get app name and info - just run it and click on app")


        args = parser.parse_args()
        return args


        ################################################################## VMS


    def run_i3(self , app_list):
        for app in app_list:
            # Switch to the desired workspace
            subprocess.run(f'i3-msg "workspace {app[3]}"', shell=True)
            
            # Optional: Add a small delay to ensure the workspace switch is complete
            time.sleep(3)  # Adjust the delay as needed

            # Execute the application
            subprocess.Popen(app[2], shell=True)

            # Optional: Add a delay to allow the application to start
            time.sleep(3)  # Adjust the delay as needed

        ################################################################### app info
    def app_info(self):
        os.system('xprop | grep ^WM_NAME')

        ################################################################### main

    def spaces(self, args):

        # Expand the path to the user's home directory
        config_dir = os.path.expanduser('~/.config/spaces')

        # Create the directory if it doesn't exist
        try:
            os.makedirs(config_dir)
        except FileExistsError:
            # Directory already exists
            pass

        # Connect to the SQLite database
        db_path = os.path.join(config_dir, 'spaces.db')  # Specify a database file name

        conn = sqlite3.connect(db_path)

        cursor = conn.cursor()
        self.create_db(cursor)

        if args.read_workspace:
            workspaces = self.read_all_workspaces(cursor)  # Get all workspaces
            self.create_table_workspaces(workspaces)  # Pass them to the table
        elif args.make:
            self.new_record_workspace(cursor, args.make)
            ws_items = self.read_all_workspace_items(cursor, args.make)
            self.create_table_items(args.make, ws_items)
        elif args.add_item :
            self.new_record_item(cursor , args.add_item[0] , args.add_item[1] , args.add_item[2]  )
            ws_items = self.read_all_workspace_items(cursor , args.add_item[0])
            self.create_table_items(args.add_item[0] , ws_items)
        elif args.remove_item :
            self.delete_item(cursor , args.remove_item[0] ,args.remove_item[1],args.remove_item[2])
            ws_items = self.read_all_workspace_items(cursor , args.remove_item[0])
            self.create_table_items(args.remove_item[0] , ws_items)
        elif args.remove_workspace :
            self.delete_a_workspace(cursor , args.remove_workspace)
            print("worksapce  "+  args.remove_workspace + "  deleted")
        elif args.run_i3 :
            ws_items = self.read_all_workspace_items(cursor , args.run_i3)
            self.create_table_items(args.run_i3 , ws_items)
            self.run_i3(ws_items)
        elif args.xprop :
            self.app_info()




        cursor.close()
        conn.commit()
        conn.close()


if __name__ == "__main__":
    # user_name = input("Enter your name: ")
    app = Spaces()
    args = app.make_ARGS()

    # Call the main method
    app.spaces(args)
