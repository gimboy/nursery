package Task14.Services;
import Task14.Data.HomeAnimal.HomeAnimal;

public class DogServices extends HomeAnimal{

    private String breed;
    private String height;

    public DogServices(String name, int age, String breed, String height) {
        this.name = name;
        this.age = age;
        this.breed = breed;
        this.height = height;
    }

    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public void voice(String command) {
        if (command == "voice!")
            System.out.println("Dog barks on command");
        else System.out.println("The dog doesn't know the command");
    }

    public void lie(String command) {
        if (command == "lie!")
            System.out.println("The dog lies down on command");
        else System.out.println("The dog doesn't know the command");
    }

    public void teachCommand() {
        System.out.println("Send your dog for training");
    }

    @Override
    public String toString() {
        return "Dog{" +
                "name='" + name + '\'' +
                "age='" + age + '\'' +
                "breed='" + breed + '\'' +
                ", height='" + height + '\'' +
                '}';
    }
    
}
