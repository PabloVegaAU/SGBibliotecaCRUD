package pe.autonoma.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
//Coneccion con la base de datos de la biblioteca
public class ConectaDb {
	private final String database;
    private String message;

    public Connection getConnection() {
        Connection cn = null;

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            cn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/" + database,
                    "pablovega","pablovega");

        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException ex) {
            setMessage(ex.getMessage());
        }

        return cn;
    }

    public ConectaDb() {
        this.database = "biblioteca";
    }

    public ConectaDb(String database) {
        this.database = database;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
