package Task14;
import java.util.Scanner;
import Task14.Services.DogServices;
import Task14.Services.CatServices;
import Task14.Services.HamsterServices;
public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Please enter the type of pet:\n" + "1 - Dog \n2 - Cat \n3 - Hamster");
        try {
            int pet = scanner.nextInt();
            switch (pet) {
                case 1:
                    System.out.println("Please enter in order:\n" +
                            "- dog name\n- dog's age (in months)\n- dog breed\n" +
                            "- dog height(small, medium, large)");
                    String dogName = scanner.next();
                    int dogAge = scanner.nextInt();
                    String dogBreed = scanner.next();
                    String dogHeight = scanner.next();
                    DogServices dog = new DogServices(dogName, dogAge, dogBreed, dogHeight);
                    System.out.println("New pet details added to pet registry:");
                    System.out.println(dog);
                    System.out.println("The dog knows how to follow commands:\n" +
                            "- cast a vote\n" +
                            "- lie\n" +
                            "Want to teach your dog a new command? (y/n)");
                    String teach = scanner.next();
                    if (teach.equalsIgnoreCase("y")) dog.teachCommand();
                    else if (teach.equalsIgnoreCase("n")) System.out.println("Completing the registry");
                    else System.out.println("Enter correct data!");
                    break;

                case 2:
                    System.out.println("Please enter in order:\n" +
                            "- cat's name\n- cat's age (in months)\n- cat's breed\n" +
                            "- coat color");
                    String catName = scanner.next();
                    int catAge = scanner.nextInt();
                    String catBreed = scanner.next();
                    String catColor = scanner.next();
                    CatServices cat = new CatServices(catName, catAge, catBreed, catColor);
                    System.out.println("The data of a new pet has been entered into the pet registry:");
                    System.out.println(cat);
                    break;
                case 3:
                    System.out.println("Please enter in order:\n" +
                            "- hamster's name\n- hamster age (in months)\n- hamster's breed\n" +
                            "- weight (heavy, light)");
                    String hamsterName = scanner.next();
                    int hamsterAge = scanner.nextInt();
                    String hamsterBreed = scanner.next();
                    String hamsterWeight = scanner.next();
                    HamsterServices hamster = new HamsterServices(hamsterName, hamsterAge, hamsterBreed, hamsterWeight);
                    System.out.println("The data of a new pet has been entered into the pet registry:");
                    System.out.println(hamster);
                    break;
                default:
                    System.out.println("Enter correct data!");
            }
        } 
        catch (Exception e) {
            System.out.println("Enter correct data!");
        }
    }   
}
