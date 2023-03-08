package Task14.Controller;
import java.io.IOException;

public class Count implements AutoCloseable {

    private int count = 0;

    public void add() {
        if (Regist.clickButton().equals("Get a new animal"))
            count++;
    }

    @Override
    public void close() throws IOException {
        if (Regist.fillFieldsOfAnimal().equals("All animal fields are filled"))
            System.out.println("Counter closed");
        else throw new IOException();
    }

}
