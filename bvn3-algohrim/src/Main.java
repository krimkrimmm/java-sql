//Cho một class Student:
//Thực hiện các nhiệm vụ sau:
//
//#1. Sắp xếp học sinh theo fullName, nếu giống fullName thì ai nhiều tuổi hơn thì đứng trước.
//
//#2. Sắp xếp học sinh theo tuổi tăng dần, nếu bằng tuổi thì xếp theo GPA giảm dần
//
//#3. Sắp xếp theo tên. (Ví dụ là Hoàng Văn A, thì chỉ xét A thôi)

import entities.Student;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<Student> students = new ArrayList<>();
        students.add(new Student("Hoang Anh", 21, 8));
        students.add(new Student("Nguyen Anh", 22, 7));
        students.add(new Student("Hoang Anh", 23, 8));
        students.add(new Student("Nguyen Hoang", 20, 6));
        students.add(new Student("Hoang Bao", 23, 9));

        // 1. Sắp xếp theo fullName, nếu giống fullName thì ai nhiều tuổi hơn thì đứng trước
        students.sort(Comparator.comparing(Student::getfullName)
                .thenComparing(Comparator.comparingInt(Student::getAge).reversed()));

        System.out.println("1. Sắp xếp theo fullName và tuổi:");
        students.forEach(System.out::println);

        // 2. Sắp xếp theo tuổi tăng dần, nếu bằng tuổi thì xếp theo GPA giảm dần
        students.sort(Comparator.comparingInt(Student::getAge)
                .thenComparing(Comparator.comparingInt(o -> Student.getGPA(o)).reversed()));

        System.out.println("\n2. Sắp xếp theo tuổi và GPA:");
        students.forEach(System.out::println);

        // 3. Sắp xếp theo tên (chỉ xét tên cuối cùng)
        students.sort(Comparator.comparing(student -> {
            String[] nameParts = student.getfullName().split(" ");

            return nameParts[nameParts.length - 1]; // Lấy phần tên cuối cùng
        }));

        System.out.println("\n3. Sắp xếp theo tên (chỉ xét tên cuối cùng):");
        students.forEach(System.out::println);
    }
}
