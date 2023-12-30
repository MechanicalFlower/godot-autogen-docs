extends "res://addons/gut/test.gd"

const Collector := preload("res://addons/godot-autogen-docs/collector.gd")

var collector: SceneTree


func before_each():
	collector = Collector.new()


func test_find_files():
	# Mock a directory structure for testing
	var mock_dir = "res://test/mock/"
	var mock_files = ["file1.gd", "file2.gd", "subdir/file3.gd"]

	# Create mock directories
	DirAccess.make_dir_recursive_absolute(mock_dir)
	DirAccess.make_dir_recursive_absolute(mock_dir.path_join("subdir"))

	# Create mock files
	for filename in mock_files:
		var file_path = mock_dir.path_join(filename)
		print(file_path)
		var file = FileAccess.open(file_path, FileAccess.WRITE)
		file.store_string("mock content")
		file.close()

	# Test find_files function
	var files = Array(collector.find_files(mock_dir, ["*.gd"], true))
	files.sort()

	# Assert the result
	var excepted_array := [
		mock_dir.path_join("file1.gd"),
		mock_dir.path_join("file2.gd"),
		mock_dir.path_join("subdir/file3.gd")
	]
	excepted_array.sort()
	assert_eq(excepted_array, files)

	# Clean up: remove mock files
	for filename in mock_files:
		var file_path = mock_dir.path_join(filename)
		DirAccess.remove_absolute(file_path)


func test_save_text():
	# Test save_text function
	var test_path = "res://test/mock/test_file.txt"
	var test_content = "This is a test content."

	# Create mock directory
	DirAccess.make_dir_recursive_absolute("res://test/mock/")

	collector.save_text(test_path, test_content)

	# Assert the file is saved correctly
	var file = FileAccess.open(test_path, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	assert_eq(test_content, content)

	# Clean up: remove the test file
	DirAccess.remove_absolute(test_path)

# func test_get_reference():
#     # Mock files to test
#     var mock_dir = "res://test/mock/"
#     var mock_files = ["file1.gd", "file2.gd"]

#     # Create mock directories
#     DirAccess.make_dir_recursive_absolute(mock_dir)

#     # Create mock files
#     for filename in mock_files:
#         var file_path = mock_dir.path_join(filename)
#         var file = FileAccess.open(file_path, FileAccess.WRITE)
#         file.store_string("# Mock GDScript file content")
#         file.close()

#     # Test get_reference function
#     var reference_data = collector.get_reference(mock_files)

#     # Assert the result
#     assert_has(reference_data, "name")
#     assert_has(reference_data, "description")
#     assert_has(reference_data, "version")
#     assert_has(reference_data, "classes")

#     # Clean up: remove mock files
#     for filename in mock_files:
#         var file_path = mock_dir.path_join(filename)
#         DirAccess.remove_absolute(file_path)
