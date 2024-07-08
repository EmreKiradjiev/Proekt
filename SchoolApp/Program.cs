using System;
using System.Linq;
using static SchoolApp.SchoolContext;
using SchoolApp;

class Program
{
    static void Main(string[] args)
    {
        using (var context = new SchoolContext())
        {
            var studentRepository = new StudentRepository(context);

            while (true)
            {
                Console.WriteLine("School Management System Menu:");
                Console.WriteLine("1. Add Student");
                Console.WriteLine("2. View All Students");
                Console.WriteLine("3. Update Student");
                Console.WriteLine("4. Delete Student");
                Console.WriteLine("5. Exit");
                Console.Write("Enter your choice: ");

                int choice;
                if (!int.TryParse(Console.ReadLine(), out choice))
                {
                    Console.WriteLine("Invalid input. Please enter a number.");
                    continue;
                }

                switch (choice)
                {
                    case 1:
                        AddStudent(studentRepository);
                        break;
                    case 2:
                        ViewAllStudents(studentRepository);
                        break;
                    case 3:
                        UpdateStudent(studentRepository);
                        break;
                    case 4:
                        DeleteStudent(studentRepository);
                        break;
                    case 5:
                        Console.WriteLine("Exiting...");
                        return;
                    default:
                        Console.WriteLine("Invalid choice. Please enter a number between 1 and 5.");
                        break;
                }
            }
        }
    }

    static void AddStudent(StudentRepository studentRepository)
    {
        Console.WriteLine("Enter details for new student:");
        Console.Write("First Name: ");
        string firstName = Console.ReadLine();
        Console.Write("Last Name: ");
        string lastName = Console.ReadLine();
        Console.Write("Address ID: ");
        int addressId = int.Parse(Console.ReadLine());
        Console.Write("Class ID: ");
        int classId = int.Parse(Console.ReadLine()); 
        Console.Write("Date of Birth (YYYY-MM-DD): ");
        DateTime dateOfBirth = DateTime.Parse(Console.ReadLine());

        var newStudent = new Student
        {
            FirstName = firstName,
            LastName = lastName,
            AddressID = addressId,
            ClassID = classId,
            DateOfBirth = dateOfBirth
        };

        studentRepository.AddStudent(newStudent);
        Console.WriteLine("Student added successfully.");
    }

    static void ViewAllStudents(StudentRepository studentRepository)
    {
        var students = studentRepository.GetAllStudents();
        Console.WriteLine("List of Students:");
        foreach (var student in students)
        {
            Console.WriteLine($"{student.StudentID}: {student.FirstName} {student.LastName}");
        }
    }

    static void UpdateStudent(StudentRepository studentRepository)
    {
        Console.Write("Enter Student ID to update: ");
        int studentId = int.Parse(Console.ReadLine());

        var student = studentRepository.GetStudentById(studentId);
        if (student == null)
        {
            Console.WriteLine($"Student with ID {studentId} not found.");
            return;
        }

        Console.WriteLine($"Updating student: {student.FirstName} {student.LastName}");
        Console.Write("Enter new First Name (leave blank to keep current): ");
        string newFirstName = Console.ReadLine();
        if (!string.IsNullOrWhiteSpace(newFirstName))
        {
            student.FirstName = newFirstName;
        }

        Console.Write("Enter new Last Name (leave blank to keep current): ");
        string newLastName = Console.ReadLine();
        if (!string.IsNullOrWhiteSpace(newLastName))
        {
            student.LastName = newLastName;
        }

        Console.Write("Enter new Address ID (leave blank to keep current): ");
        int newAddressId;
        if (int.TryParse(Console.ReadLine(), out newAddressId))
        {
            student.AddressID = newAddressId;
        }

        Console.Write("Enter new Class ID (leave blank to keep current): ");
        int newClassId;
        if (int.TryParse(Console.ReadLine(), out newClassId))
        {
            student.ClassID = newClassId;
        }

        Console.Write("Enter new Date of Birth (YYYY-MM-DD, leave blank to keep current): ");
        DateTime newDateOfBirth;
        if (DateTime.TryParse(Console.ReadLine(), out newDateOfBirth))
        {
            student.DateOfBirth = newDateOfBirth;
        }

        studentRepository.UpdateStudent(student);
        Console.WriteLine("Student updated successfully.");
    }

    static void DeleteStudent(StudentRepository studentRepository)
    {
        Console.Write("Enter Student ID to delete: ");
        int studentId = int.Parse(Console.ReadLine());

        var student = studentRepository.GetStudentById(studentId);
        if (student == null)
        {
            Console.WriteLine($"Student with ID {studentId} not found.");
            return;
        }

        Console.WriteLine($"Deleting student: {student.FirstName} {student.LastName}");
        studentRepository.DeleteStudent(studentId);
        Console.WriteLine("Student deleted successfully.");
    }
}
