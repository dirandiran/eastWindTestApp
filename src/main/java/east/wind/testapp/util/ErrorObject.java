package east.wind.testapp.util;

/**
 * Created by pavel.klevakin on 25.11.2016.
 */
public class ErrorObject {
    private String message;

    public ErrorObject(String message) {
        this.message = message;
    }

    public ErrorObject() {
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
