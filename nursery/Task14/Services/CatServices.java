package Task14.Services;
import Task14.Data.HomeAnimal.HomeAnimal;

public class CatServices extends HomeAnimal{

    private String breed;
    private String color;

    public CatServices(String name, int age, String breed, String color) {
        this.name = name;
        this.age = age;
        this.breed = breed;
        this.color = color;
    }
    
    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void play(String action) {
        if (action == "Show toy")
            System.out.println("The cat starts to play");
        else System.out.println("The cat is leaving");
    }

    public void sleep(String action) {
        if (action == "pet the cat")
            System.out.println("The cat falls asleep");
        else System.out.println("The cat is leaving");
    }

    @Override
    public String toString() {
        return "Cat{" +
                "name='" + name + '\'' +
                "age='" + age + '\'' +
                "breed='" + breed + '\'' +
                ", color='" + color + '\'' +
                '}';
    }
}

