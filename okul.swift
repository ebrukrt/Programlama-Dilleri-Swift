import Foundation

func runTask(launchPath: String, flags: [String]) -> String {
  let task = Process()
      task.launchPath = launchPath
      task.arguments = flags

      let pipe = Pipe()
      task.standardOutput = pipe
      task.launch()

      let data = pipe.fileHandleForReading.readDataToEndOfFile()
      let output: String? = String(data: data, encoding: String.Encoding.utf8)!

      return output!
}
let output = runTask(launchPath:"/bin/echo", flags: ["merhaba"])
print(output)
