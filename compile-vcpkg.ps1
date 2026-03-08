# 设置环境变量
$env:VCPKG_ROOT = "E:\vcpkg"

# 导入 Visual Studio 环境
$vsPath = "C:\Program Files\Microsoft Visual Studio\18\Enterprise"
Import-Module "$vsPath\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"
Enter-VsDevShell -VsInstallPath $vsPath -SkipAutomaticLocation -DevCmdArguments "-arch=x64"

# 设置 Ninja 路径
$env:PATH = "E:\vcpkg\downloads\tools\ninja\1.13.1-windows;$env:PATH"

# 清理并配置
Remove-Item -Recurse -Force out/build/Win-x64-Release -ErrorAction SilentlyContinue
& "$vsPath\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" --preset Win-x64-Release

# 执行构建
& "$vsPath\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" --build out/build/Win-x64-Release
