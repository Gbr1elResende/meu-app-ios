# meu-app-ios
Clone do Spotify: Guia de Estudo CompletoEste documento serve como um guia detalhado, teórico e prático, para a construção de uma aplicação iOS clone do Spotify. O objetivo é solidificar os conhecimentos essenciais de desenvolvimento com UIKit, abordando desde a estruturação da navegação até a criação de listas dinâmicas, para que sirva como material de estudo abrangente para a sua prova.1. Conceitos Fundamentais (O Que Você Precisa Saber)Antes de mergulhar no código, é crucial entender os blocos de construção que usaremos.UI Components (Peças do Quebra-Cabeça)TermoÍcone (SF Symbol)ExplicaçãoAnalogiaViewControllerrectangle.portrait.on.rectangle.portraitÉ o "cérebro" de uma tela. Gerencia a visão (o que o usuário vê) e os dados daquela tela.O gerente de uma loja. Ele decide quais produtos (dados) vão para a prateleira (view) e como os clientes interagem com eles.Tab Bar Controllermenubar.rectangleUm contêiner que gerencia a troca entre diferentes telas (ViewControllers) através de uma barra de abas na parte inferior.O menu principal de um aplicativo de celular (como o próprio Spotify), onde você clica em "Início", "Buscar" ou "Sua Biblioteca".Button (UIButton)square.and.pencilUm elemento que o usuário pode tocar para disparar uma ação.Um interruptor de luz. Você o pressiona para que algo aconteça (a luz acender).Slider (UISlider)slider.horizontal.3Um controle que permite ao usuário selecionar um valor dentro de um intervalo contínuo, arrastando um indicador.O controle de volume do seu celular ou o controle de brilho da tela.Table View (UITableView)list.bulletUma visão que apresenta dados em uma lista rolável de linhas (células).A sua lista de contatos no celular, uma lista de e-mails ou a lista de músicas em uma playlist.Table View Cell (UITableViewCell)list.bullet.rectangleRepresenta uma única linha (um item) dentro de uma Table View.Um único contato na sua lista de contatos. Ele contém o nome, o número, etc.Conectores e Ações (A "Cola" e os "Gatilhos")TermoÍcone (SF Symbol)ExplicaçãoAnalogia@IBOutletlink(Interface Builder Outlet) É uma "ponte" que conecta um elemento do Storyboard (visual) ao código Swift, permitindo que você o manipule (mude seu texto, cor, valor, etc.).A tomada na parede. Ela conecta o seu aparelho (código) à rede elétrica (elemento visual) para que você possa usá-lo.@IBActionbolt.fill(Interface Builder Action) É uma "ponte" que conecta uma ação do usuário em um elemento do Storyboard (como um toque no botão) a um método (função) no seu código.O botão do controle remoto. Quando você o aperta (ação do usuário), ele envia um sinal (chama a função) para a TV (código) fazer algo.Seguearrow.right.squareDefine a transição entre duas telas (ViewControllers) no Storyboard. "Present Modally" é um tipo de segue que apresenta a nova tela sobre a atual.Uma porta entre dois cômodos. Abrir a porta ("acionar a segue") leva você de um cômodo (tela) para outro.TimertimerUm objeto que dispara uma ação em intervalos de tempo específicos. Pode ser usado para tarefas repetitivas, como atualizar uma barra de progresso.Um despertador que toca a cada 5 minutos. A cada "toque", ele executa uma tarefa.struct (Estrutura)doc.textUma forma de agrupar dados relacionados. Em Swift, structs são "Tipos de Valor", o que significa que, quando você as copia, cria uma cópia independente. Ideal para modelar dados simples.Uma ficha de cadastro de um livro, contendo campos para "título" e "autor". Cada ficha é independente.Protocolos e Padrões (As "Regras do Jogo")TermoÍcone (SF Symbol)ExplicaçãoAnalogiaUITableViewDataSourcedoc.richtextUm protocolo que define os métodos que um objeto deve implementar para fornecer os dados para uma Table View. Ele responde a duas perguntas cruciais: "Quantas linhas você tem?" e "Qual célula eu mostro para esta linha específica?".O bibliotecário. A estante de livros (TableView) não sabe quantos livros tem nem qual livro colocar em cada prateleira. Ela pergunta ao bibliotecário (DataSource), que tem a lista e sabe onde cada livro vai.dequeueReusableCellarrow.3.trianglepathUm método de otimização da Table View. Em vez de criar uma nova célula para cada item da lista (o que seria muito lento para listas grandes), a Table View reutiliza as células que já saíram da tela. dequeueReusableCell "pede" uma célula reutilizável.Um restaurante com pratos limitados. Em vez de dar um prato novo a cada cliente, o garçom pega os pratos já usados, lava-os (reseta o conteúdo) e os entrega a novos clientes. É muito mais eficiente.2. Conteúdo Teórico (Como as Peças se Encaixam)Arquitetura Model-View-Controller (MVC)Esta atividade segue o padrão de design MVC, fundamental no desenvolvimento iOS:Model (Modelo): A camada de dados. No nosso caso, a struct MusicData é o nosso modelo. Ela não se preocupa com a aparência, apenas em representar os dados (nome da música, artista).View (Visão): A camada de interface do usuário (UI). Tudo que está no Storyboard (botões, sliders, células da tabela) pertence a esta camada. Ela é "burra", apenas exibe o que o Controller manda.Controller (Controlador): O intermediário. Nossos ViewControllers são os controladores. Eles pegam os dados do Model (MusicData) e decidem como a View (UITableView, UILabel) deve exibi-los. Também recebem as ações do usuário da View (@IBAction) e atualizam o Model ou a própria View.O Padrão Delegate: O Exemplo do UITableViewDataSourceO UITableViewDataSource é o exemplo perfeito do padrão de design Delegate (Delegação).A UITableView sabe como desenhar uma lista, como rolar, etc. Mas ela não sabe quais dados mostrar.Para resolver isso, ela delega essa responsabilidade para outro objeto, o seu dataSource.Quando você faz tableView.dataSource = self no seu ViewController, você está dizendo: "Ei, Table View, quando precisar de dados, fale comigo (o ViewController)".A Table View então vai chamar os métodos obrigatórios do protocolo (tableView(_:numberOfRowsInSection:) e tableView(_:cellForRowAt:)) no ViewController para obter as informações de que precisa.3. Conteúdo Prático (Passo a Passo)Vamos construir o aplicativo, tela por tela, seguindo as instruções.Parte 1: Estrutura Principal com Tab Bar ControllerO objetivo aqui é criar a navegação principal do aplicativo com duas abas: "Home" e "Curtidas".Criando o Tab Bar Controller:No seu Main.storyboard, selecione o ViewController inicial.No menu superior, vá em Editor > Embed In > Tab Bar Controller.Isso criará um UITabBarController e o definirá como a tela inicial, com sua primeira tela já conectada como a primeira aba.Configurando a Tela Home:O ViewController que já estava conectado agora é a sua tela "Home".Clique no Tab Bar Item na parte inferior dessa tela (pode ser necessário clicar na barra cinza escura abaixo da view principal).No Attributes Inspector (ícone de escudo no painel direito), procure por "System Item" e selecione "Most Recent". O ícone house.fill aparecerá automaticamente.Criando e Configurando a Tela de Curtidas:Arraste um novo View Controller da Object Library (+ no canto superior direito) para o seu Storyboard.Pressione Ctrl e arraste do Tab Bar Controller para este novo View Controller. Uma pequena janela aparecerá. Selecione view controllers sob "Relationship Segue".Isso criará a segunda aba.Clique no Tab Bar Item da nova tela e, no Attributes Inspector, selecione o "System Item" como "Favorites". O ícone books.vertical.fill (ou um similar como heart.fill) será aplicado.Adicionando o Botão "Player" na Home:Na tela Home, arraste um Button da Object Library.Posicione-o acima da Tab Bar.Arraste um novo View Controller para o Storyboard. Esta será a sua tela de "Play".Pressione Ctrl e arraste do botão na tela Home para a nova tela de Play.No menu que aparece, selecione Present Modally. Uma segue (seta) será criada, indicando a transição.Parte 2: Tela de PlayEsta tela simulará a reprodução de uma música com um timer e um slider.Crie o Arquivo da ViewController:Crie um novo arquivo Swift (File > New > File... > Cocoa Touch Class).Nomeie-o como PlayViewController e certifique-se de que ele herda de UIViewController.Associe o Arquivo à Tela no Storyboard:Selecione a tela de Play no Storyboard.No Identity Inspector (ícone de jornal), no campo "Class", digite e selecione PlayViewController.Desenhe a Interface:Arraste um Button para a tela. Este será o botão Play/Pause.Arraste um Slider para a tela.Conecte os Elementos ao Código (@IBOutlet e @IBAction):Abra a tela de Play no Storyboard e o arquivo PlayViewController.swift lado a lado usando o Assistant Editor.Conecte o Slider: Pressione Ctrl, arraste do UISlider no Storyboard para dentro da classe PlayViewController. Crie um Outlet e nomeie-o slider.Conecte o Botão (Ação): Pressione Ctrl, arraste do UIButton para dentro da classe. Crie uma Action, nomeie-a playPauseTapped, e certifique-se que o "Type" é UIButton.Conecte o Botão (Outlet): Repita o processo, mas desta vez crie um Outlet para o botão e nomeie-o playPauseButton. Precisamos do outlet para mudar seu ícone.Implemente a Lógica no PlayViewController.swift:import UIKit

class PlayViewController: UIViewController {

    // 1. Conexões com o Storyboard
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var playPauseButton: UIButton!

    // 2. Atributos para controlar o estado
    var timer: Timer?
    var playing: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Configuração inicial
        updatePlayButtonIcon()
        slider.value = 0.0 // Começa o slider no início
    }

    // 3. Ação do botão Play/Pause
    @IBAction func playPauseTapped(_ sender: UIButton) {
        playing.toggle() // Inverte o valor booleano (true vira false, false vira true)
        
        if playing {
            startTimer()
        } else {
            pauseTimer()
        }
        
        updatePlayButtonIcon()
    }

    // 4. Funções para controlar o Timer
    func startTimer() {
        // Garante que não haja timers duplicados
        timer?.invalidate() 
        
        // Cria um timer que chama a função 'updateSlider' a cada 0.1 segundos, repetidamente
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
    }

    func pauseTimer() {
        // Para o timer
        timer?.invalidate()
    }
    
    // 5. Função chamada pelo Timer (callback)
    @objc func updateSlider() {
        // Se o slider não chegou ao fim
        if slider.value < slider.maximumValue {
            // Aumenta o valor do slider um pouco. O valor '0.001' controla a "velocidade".
            slider.value += 0.001
        } else {
            // Se a "música" acabou, para tudo
            playing = false
            pauseTimer()
            slider.value = 0.0 // Reseta o slider
            updatePlayButtonIcon()
        }
    }
    
    // 6. Função para atualizar o ícone do botão
    func updatePlayButtonIcon() {
        let iconName = playing ? "pause.fill" : "play.fill"
        let iconImage = UIImage(systemName: iconName)
        playPauseButton.setImage(iconImage, for: .normal)
    }
}
Parte 3: Tela de Curtidas com UITableViewEsta tela mostrará uma lista de músicas usando o poderoso UITableView.Crie o Modelo de Dados:Crie um novo arquivo Swift (File > New > File... > Swift File).Nomeie-o MusicData.swift.Dentro dele, defina a struct:import Foundation

struct MusicData {
    let title: String
    let artist: String
}
Crie a ViewController e a Célula Personalizada:Crie um novo arquivo Cocoa Touch Class chamado LikedSongsViewController, herdando de UIViewController.Crie outro arquivo Cocoa Touch Class chamado MusicTableViewCell, herdando de UITableViewCell.Configure o Storyboard:Associe a ViewController: Selecione a tela de Curtidas e no Identity Inspector, mude a classe para LikedSongsViewController.Adicione a Table View: Arraste uma UITableView da Object Library para a tela de Curtidas. Use as constraints para que ela ocupe a tela toda.Conecte a Table View: Crie um @IBOutlet da UITableView para o LikedSongsViewController e nomeie-o tableView.Configure a Célula:Dentro da UITableView no Storyboard, você verá uma "Table View Cell". Selecione-a.No Attributes Inspector, defina o Identifier como musicCell. Este nome é crucial.No Identity Inspector, mude a Class da célula para MusicTableViewCell.Arraste duas UILabels para dentro da célula. Uma para o título da música (fonte maior) e outra para o artista (fonte menor).Conecte as Labels da Célula:Abra o MusicTableViewCell.swift e a tela do Storyboard lado a lado.Crie @IBOutlets da label de título para uma variável titleLabel e da label de artista para artistLabel dentro da classe MusicTableViewCell.Implemente a Lógica no LikedSongsViewController.swift:import UIKit

// 1. Adote os protocolos UITableViewDataSource e UITableViewDelegate
class LikedSongsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // 2. Conexão com a Table View do Storyboard
    @IBOutlet weak var tableView: UITableView!
    
    // 3. Crie a lista de músicas (o nosso "Model")
    let likedSongs: [MusicData] = [
        MusicData(title: "Bohemian Rhapsody", artist: "Queen"),
        MusicData(title: "Smells Like Teen Spirit", artist: "Nirvana"),
        MusicData(title: "Hotel California", artist: "Eagles"),
        MusicData(title: "Stairway to Heaven", artist: "Led Zeppelin"),
        MusicData(title: "Imagine", artist: "John Lennon"),
        MusicData(title: "Like a Rolling Stone", artist: "Bob Dylan")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 4. Diga à Table View que esta classe é sua fonte de dados e seu delegate
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // --- MÉTODOS OBRIGATÓRIOS DO UITableViewDataSource ---
    
    // PERGUNTA 1: "Quantas linhas devo mostrar?"
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // A resposta é a quantidade de itens na nossa lista
        return likedSongs.count
    }
    
    // PERGUNTA 2: "Qual célula devo mostrar para a linha X?"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 5. Peça uma célula reutilizável com o identificador 'musicCell'.
        // O 'as! MusicTableViewCell' converte a célula genérica para a nossa classe personalizada.
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath) as! MusicTableViewCell
        
        // 6. Acesse a música correspondente a esta linha.
        // indexPath.row é o número da linha (0, 1, 2, ...)
        let music = likedSongs[indexPath.row]
        
        // 7. Configure as labels da célula com os dados da música
        cell.titleLabel.text = music.title
        cell.artistLabel.text = music.artist
        
        // 8. Retorne a célula configurada
        return cell
    }
}
Ao final deste passo a passo, você terá um aplicativo funcional que aborda todos os requisitos da atividade, com uma base sólida dos conceitos mais importantes do desenvolvimento iOS com UIKit.