package Task14.Data;

public abstract class Animal {

    protected int age;
    protected String numberOfParts;

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    private void eat() {
        System.out.println("Animal eats");
    }

    private void move() {
        System.out.println("The animal moves");
    }

    private void breathe() {
        System.out.println("The animal breathes");
    }
}