using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace SchoolApp
{
    public class SchoolContext : DbContext
    {
        public DbSet<Student> Students { get; set; }
        public DbSet<Teacher> Teachers { get; set; }
        public DbSet<Address> Addresses { get; set; }
        public DbSet<Class> Classes { get; set; }
        public DbSet<Course> Courses { get; set; }
        public DbSet<StudentCourse> StudentCourses { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseMySql("server=localhost;database=school;user=root;password=",
                new MySqlServerVersion(new Version(8, 0, 21)));
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<StudentCourse>()
                .HasKey(sc => new { sc.StudentID, sc.CourseID });

            modelBuilder.Entity<StudentCourse>()
                .HasOne(sc => sc.Student)
                .WithMany(s => s.StudentCourses)
                .HasForeignKey(sc => sc.StudentID);

            modelBuilder.Entity<StudentCourse>()
                .HasOne(sc => sc.Course)
                .WithMany(c => c.StudentCourses)
                .HasForeignKey(sc => sc.CourseID);


        }
        public class Student
        {
            public int StudentID { get; set; }
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public DateTime DateOfBirth { get; set; }
            public int AddressID { get; set; }
            public Address Address { get; set; }
            public int ClassID { get; set; }
            public Class Class { get; set; }
            public ICollection<StudentCourse> StudentCourses { get; set; }
        }

        public class Teacher
        {
            public int TeacherID { get; set; }
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string Subject { get; set; }
            public int AddressID { get; set; }
            public Address Address { get; set; }
        }

        public class Address
        {
            public int AddressID { get; set; }
            public string Street { get; set; }
            public string City { get; set; }
            public string State { get; set; }
            public string ZipCode { get; set; }
        }

        public class Class
        {
            public int ClassID { get; set; }
            public string ClassName { get; set; }
            public int TeacherID { get; set; }
            public Teacher Teacher { get; set; }
        }

        public class Course
        {
            public int CourseID { get; set; }
            public string CourseName { get; set; }
            public ICollection<StudentCourse> StudentCourses { get; set; }
        }

        public class StudentCourse
        {
            public int StudentID { get; set; }
            public Student Student { get; set; }
            public int CourseID { get; set; }
            public Course Course { get; set; }
        }
        public class StudentRepository
        {
            private readonly SchoolContext _context;

            public StudentRepository(SchoolContext context)
            {
                _context = context;
            }

            public void AddStudent(Student student)
            {
                _context.Students.Add(student);
                _context.SaveChanges();
            }
            public Student GetStudentById(int studentId)
            {
                return _context.Students.Find(studentId);
            }
            public List<Student> GetAllStudents()
            {
                return _context.Students.ToList();
            }  
            public void UpdateStudent(Student student)
            {
                _context.Students.Update(student);
                _context.SaveChanges();
            } 
            public void DeleteStudent(int studentId)
            {
                var student = _context.Students.Find(studentId);
                if (student != null)
                {
                    _context.Students.Remove(student);
                    _context.SaveChanges();
                }
            }
        }
    
    }
}
