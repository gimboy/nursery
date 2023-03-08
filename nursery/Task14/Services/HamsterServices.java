package Task14.Services;
import Task14.Data.HomeAnimal.HomeAnimal;

public class HamsterServices extends HomeAnimal{

    private String breed;
    private String weight;

    public HamsterServices(String name, int age, String breed, String weight) {
        this.name = name;
        this.age = age;
        this.breed = breed;
        this.weight = weight;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public String getBreed() {
        return breed;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getWeight() {
        return weight;
    }

    void run(String action) {
        if (action == "put on the wheel")
            System.out.println("The hamster starts to run in the wheel");
        else System.out.println("Hamster is hiding");
    }

    void gnaw(String action) {
        if (action == "give grain")
            System.out.println("The hamster starts to gnaw on the grain");
        else System.out.println("Hamster is hiding");
    }

    @Override
    public String toString() {
        return "Hamster{" +
                "name='" + name + '\'' +
                "age='" + age + '\'' +
                "breed='" + breed + '\'' +
                ", weight='" + weight + '\'' +
                '}';
    }
}

