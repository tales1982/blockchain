import { useState } from 'react';
import { mint } from './Web3Service'

function App() {

  const [message, setMessage] = useState("");

  function onBtnClick(){
    setMessage("Requesdting you tokens...wait...")
    mint()
      .then((tx) => setMessage("You tokens were sent. tx: " + tx))
      .catch(err => setMessage(err.message));
  }

  return (
      <div className="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
        <header className="mb-auto">
          <div>
            <h3 className="float-md-start mb-0">ProtoCoin Faucet</h3>
            <nav className="nav nav-masthead justify-content-center float-md-end">
            { /* eslint-disable-next-line */}
              <a
                className="nav-link fw-bold py-1 px-0 active"
                aria-current="page"
                href="#"
              >
                Home
              </a>
              { /* eslint-disable-next-line */}
              <a className="nav-link fw-bold py-1 px-0" href="#">
                About
              </a>
            </nav>
          </div>
        </header>

        <main className="px-3">
          <h1>Get your ProtoCoin.</h1>
          <p className="lead">
            Once a day, earn 1.000 coins for free just connecting your MetaMask
            below.
          </p>
          <p className="lead">
          { /* eslint-disable-next-line */}
            <a
              href="#" onClick={onBtnClick}
              className="btn btn-lg btn-light fw-bold border-white bg-white"
            >
              <img src="/assets/metamask-icon.svg" alt="MetaMask" width={44} />
              Connect Meta
            </a>
          </p>
          <p className='lead'>
            {message}
          </p>
        </main>

        <footer className="mt-auto text-white-50">
          <p>
            Build by{" "}
            <a href="https://getbootstrap.com/" className="text-white">
              Tales
            </a>
          </p>
        </footer>
      </div>
 
  );
}

export default App;
