package hw3;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class HW3 {

	public static Connection mainConnection = null;
	public static Statement mainStatement = null;
	public static ResultSet rs = null;

	public static void getConnectionToDB() {
		try {

			// loading Oracle Driver
			System.out.print("Looking for Oracle's jdbc-odbc driver ... ");
			DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
			System.out.println(", Loaded.");

			String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
			String userName = "Scott";
			String password = "tiger";

			System.out.print("Connecting to DB...");
			mainConnection = DriverManager.getConnection(URL, userName,
					password);
			System.out.println(", Connected!");

			mainStatement = mainConnection.createStatement();

		} catch (Exception e) {
			System.out.println("Error while connecting to DB: " + e.toString());
			e.printStackTrace();
			System.exit(-1);
		}
	}

	public static void createTables() throws SQLException {
		mainStatement
				.execute("CREATE TABLE BOOK ( BOOK_ID  NUMBER PRIMARY KEY, BOOK_DATA xmltype ) ");
		mainStatement
				.execute("CREATE TABLE REVIEW ( REVIEW_ID  NUMBER PRIMARY KEY, REVIEW_DATA xmltype ) ");
	}

	public static void insertRecords(String path) throws SQLException,
			FileNotFoundException {
		Scanner s = new Scanner(new File(path));
		while (s.hasNext()) {
			mainStatement.executeQuery(" " + s.nextLine() + " ");
		}
	}

	public static void main(String[] args) throws SQLException,
			FileNotFoundException {
		getConnectionToDB();
		createTables();
		insertRecords(args[0]);
	}
}
