package util;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 * @author sanghuncho
 *
 */
public class DateUtil {

    public static Date toSqlDate(LocalDate localDate) {
        return java.sql.Date.valueOf( localDate );
    }
    
    public static LocalDate toLocalDate(Date sqlDate) {
        return sqlDate.toLocalDate();
    }
    
    public static String formattedLocalDate(LocalDate localDate) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd");
        return formatter.format(localDate);
    }
}