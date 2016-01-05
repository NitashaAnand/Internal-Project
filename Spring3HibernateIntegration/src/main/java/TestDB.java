import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class TestDB {
	public static void main(String[] args) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException
	{
		try
		{
		String url = "jdbc:postgresql://localhost:5432/TimeLogDB";
		String user = "postgres";
		String password = "root";

		// Load the Connector/J driver
		Class.forName("org.postgresql.Driver").newInstance();
		// Establish connection to MySQL
		Connection conn = DriverManager.getConnection(url, user, password);
		System.out.println("success");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}
}
