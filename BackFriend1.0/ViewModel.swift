import Foundation

struct d: Codable {
    let Ax: Double
}



class ViewModel: ObservableObject {
    
    @Published var infoAx : Double = 0.0
    
    func fetch() {
        guard let url = URL(string: "http://127.0.0.1:1880/backfriend/leitura") else { return }
        
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in guard let data = data, error == nil else{
            return
        }
            do {
                let parsed = try JSONDecoder().decode(d.self, from: data)
                DispatchQueue.main.async{
                    self?.infoAx = parsed.Ax
                }
            }catch {
                print(error)
            }
        }
        task.resume()
    }
}
