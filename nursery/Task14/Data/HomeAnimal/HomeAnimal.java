package Task14.Data.HomeAnimal;
import Task14.Data.Animal;

public abstract class HomeAnimal extends Animal {

    protected String name;
    protected String utility;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private void liveHome() {
        System.out.println("The animal lives in a human dwelling");
    }
}
