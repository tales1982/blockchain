// ConnectWallet.jsx
import { useState } from "react";
import "../button.css";
import "../stylesGlobal.css";

function ConnectWallet() {
  const [account, setAccount] = useState(null);

  async function connectWallet() {
    if (!window.ethereum) {
      alert("Instale a MetaMask para continuar.");
      return;
    }

    try {
      const [walletAddress] = await window.ethereum.request({ method: "eth_requestAccounts" });
      setAccount(walletAddress);
    } catch (err) {
      console.error(err);
      alert("Falha ao conectar à MetaMask.");
    }
  }

  return (
    <>
      {account ? (
        <p>Conta conectada: <strong>{account}</strong></p>
      ) : (
        <button
          onClick={connectWallet}
          className="btn-metamask"
          type="button"
        >
          <span className="btn-icon">
            {/* SVG oficial da MetaMask */}
            <svg
              width="20"
              height="20"
              viewBox="0 0 318.6 318.6"
              xmlns="http://www.w3.org/2000/svg"
            >
              {/* cole aqui o conteúdo do SVG */}
            </svg>
          </span>
          <span className="btn-text">Conectar MetaMask</span>
        </button>
      )}
    </>
  );
}

ConnectWallet.displayName = "ConnectWallet";
export default ConnectWallet;
