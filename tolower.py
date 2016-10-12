import os

path = os.getcwd()
# or: path = 'your-path-here-as-string'

filenames = os.listdir(path)

for filename in filenames:
  fpath = os.path.join(path, filename)
  target = os.path.join(path, filename.lower())
  os.rename(fpath, target)
