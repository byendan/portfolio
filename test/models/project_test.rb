require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test "project fields are all filled" do
      p = Project.new
      assert_not p.save

      p.name = "name"
      assert_not p.save

      p.content = "Project content"
      assert_not p.save

      #Helper for correctly adding images
      add_image(p)
      assert_not p.save

      p.github = 'http://git.com'
      assert_not p.save

      p.site = 'http://site.com'
      # Message help debug the test
      assert p.save, "#{p.name}, #{p.content}, #{p.image}, #{p.github}, #{p.site}"
  end

  # Makes sure taht websites uses a transfer protocol, and has a top level domain
  test "project site must be valid website" do
    # Check that a valid project is considered valid
    valid_project = projects(:valid_site)
    add_image(valid_project)
    assert valid_project.valid?

    # Check that invalid project does not return valid
    invalid_project = valid_project
    invalid_project.github = "github"
    assert_not invalid_project.valid?

  end

end
