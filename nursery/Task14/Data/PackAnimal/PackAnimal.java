package Task14.Data.PackAnimal;
import Task14.Data.Animal;

public abstract class PackAnimal extends Animal{

    protected String name;
    protected int shipping;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private void Carry() {
        System.out.println("The animal is carrying a load");
    }
    
}
