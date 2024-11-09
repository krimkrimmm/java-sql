package entities;

public class Student {
    public String fullName;
    public int age;
    public int GPA;

    public Student(String fullName, int age, int GPA) {
        this.fullName = fullName;
        this.age = age;
        this.GPA = GPA;
    }

    @Override
    public String toString() {
        return "Student{" +
                "fullName='" + fullName + '\'' +

                ", age=" + age +
                ", GPA=" + GPA +
                '}';
    }

    public static int getAge(Object o) {

        return 0;
    }


    public static int getGPA(Object o) {

        return 0;
    }



    public String getfullName() {

        return "";
    }
}







