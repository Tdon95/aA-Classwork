# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer          needs to be validated or belong_to
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
    validates :name, presence: true
    # validates :prereq_id, presence: true

    belongs_to :instructor,
        primary_key: :id,
        foreign_key: :instructor_id,
        class_name: :User

    belongs_to :prereq,
        primary_key: :id,
        foreign_key: :prereq_id, #implies that the foreign key is not null
        class_name: :Course,
        optional: true

    # has_many :prereq_courses,
    #     primary_key: :prereq_id,
    #     foreign_key: :id,
    #     class_name: :Course

    has_many :enrolled_courses,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Enrollment

    has_many :enrolled_students,
        through: :enrolled_courses,
        source: :enrolled_student
end



# course = Course.first
# course.instructor