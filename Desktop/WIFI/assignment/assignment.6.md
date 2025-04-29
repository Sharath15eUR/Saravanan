### 1. What are the pillars of Wi-Fi security?


•	Authentication: This is the process of verifying the identity of a device or user attempting to connect to a wireless network. Only authorized users should be able to connect. Examples include pre-shared keys (PSK), WPA2-Enterprise with RADIUS, and 802.1X with EAP.

•	Encryption: Once authenticated, data transmitted between the client and access point needs to be protected from eavesdropping. Encryption ensures data confidentiality. WPA2 uses AES-based CCMP, while WPA3 uses AES-GCMP for stronger encryption.

•	Integrity: Data integrity ensures that information is not altered or tampered with during transmission. Techniques like Message Integrity Code (MIC) are used to detect any changes in the data
### 2. Explain the difference between authentication and encryption in WiFi security.
In WiFi security, **authentication** and **encryption** serve two different but equally important purposes. **Authentication** is the process of verifying that a user or device is authorized to connect to the wireless network. It ensures that only trusted users can access the network by validating credentials like passwords (WPA2/WPA3-PSK), usernames (WPA2-Enterprise), or digital certificates. On the other hand, **encryption** is used to protect the actual data transmitted over the wireless network. It converts readable data into scrambled code using encryption algorithms like AES, making it unreadable to unauthorized users even if they intercept the data. While authentication acts like a gatekeeper that checks who is allowed in, encryption acts like a lockbox that keeps data safe during transmission.

### 3. Explain the differences between WEP, WPA, WPA2, and WPA3.
| Feature        | WEP (Wired Equivalent Privacy) | WPA (Wi-Fi Protected Access) | WPA2 (Wi-Fi Protected Access II) | WPA3 (Wi-Fi Protected Access III) |
|----------------|-------------------------------|------------------------------|----------------------------------|-----------------------------------|
| **Introduced** | 1997                          | 2003                         | 2004                             | 2018                              |
| **Encryption** | RC4 (weak)                    | TKIP (improved over WEP)     | AES (strong encryption)          | AES-GCMP (stronger than WPA2)     |
| **Security**   | Very weak                     | Moderate                     | Strong                           | Very strong                       |
| **Vulnerabilities** | Easily cracked with tools     | TKIP is vulnerable           | Safer, but WPA2-PSK can be attacked | More secure handshake, protection against offline dictionary attacks |
| **Handshake**  | None                          | Pre-Shared Key (PSK)         | 4-Way Handshake                  | Simultaneous Authentication of Equals (SAE) |
| **Enterprise Support** | No                        | Yes (WPA-Enterprise)         | Yes (WPA2-Enterprise)            | Yes (WPA3-Enterprise with 192-bit security) |
              
### 4. Why is WEP considered insecure compared to WPA2 or WPA3?
WEP is insecure due to multiple vulnerabilities:
•	Uses the outdated RC4 encryption algorithm with static keys.
•	Initialization Vector (IV) is too short (24-bit), leading to collisions.
•	No effective key management or rotation.

### 5. Why was WPA2 introduced?
WPA2 (Wi-Fi Protected Access II) was introduced in 2004 to address the security weaknesses of both WEP and WPA. While WPA was only a temporary improvement using the older TKIP encryption, WPA2 brought a more robust and permanent solution by mandating the use of **AES (Advanced Encryption Standard)** for data encryption, which is much stronger and more secure than RC4 or TK


### 6. What is the role of the Pairwise Master Key (PMK) in the 4-way handshake?
The **Pairwise Master Key (PMK)** plays a central role in the **4-way handshake** process used in WPA/WPA2/WPA3 Wi-Fi security. It is a long, secure key derived from either a **Pre-Shared Key (PSK)** in personal mode or from an **802.1X authentication server** in enterprise mode. During the 4-way handshake, both the client (supplicant) and the access point (authenticator) use the PMK to generate a temporary encryption key called the **Pairwise Transient Key (PTK)**. This PTK is then used to encrypt actual data frames and ensure the integrity of messages exchanged between the client and the access point. The PMK itself is never transmitted over the air, which helps prevent attackers from capturing or reusing it.

### 7. How does the 4-way handshake ensure mutual authentication between the client and the access point?
The 4-way handshake verifies possession of the PMK by both parties:
1.	Message 1: AP sends a nonce (ANonce) to the client.
2.	Message 2: Client uses ANonce + SNonce + PMK to derive PTK and sends SNonce and MIC.
3.	Message 3: AP verifies MIC using its own PTK derivation, confirms match, and sends GTK + MIC.
4.	Message 4: Client verifies AP's MIC and completes the handshake.
Any mismatch results in handshake failure, ensuring both parties possess the correct PMK.


### 8. What will happen if we put a wrong passphrase during a 4-Way handshake?
If a wrong passphrase is used during the **4-way handshake**, the client and the access point will fail to derive the same **Pairwise Master Key (PMK)**. As a result, the **Pairwise Transient Key (PTK)** generated on both sides will not match. When the access point sends a message encrypted with its version of the PTK, the client will be unable to decrypt it correctly, and vice versa. This mismatch causes the handshake to fail, leading to **authentication failure** and the device being unable to connect to the Wi-Fi network. The user may see repeated connection attempts or an "incorrect password" error.


### 9. What problem does 802.1X solve in a network?
IEEE 802.1X solves the problem of **unauthorized access** in wired and wireless networks by providing a **port-based network access control mechanism**. It ensures that only authenticated users and devices can gain access to the network resources. 802.1X uses a framework involving three main components: the **supplicant** (user/device), the **authenticator** (switch or access point), and the **authentication server** (usually a RADIUS server). Before granting network access, the authenticator communicates with the authentication server to verify the identity of the supplicant. This process protects the network from rogue users or devices by preventing access until proper authentication is completed.



### 10. How does 802.1X enhance security over wireless networks?
802.1X enhances security by:
•	Using EAP (Extensible Authentication Protocol) for flexible authentication methods (certificates, tokens, etc.).

•	Issuing a unique PMK per session, reducing the chance of key reuse.

•	Preventing unauthorized access to the LAN until authentication is successful.

•	Supporting mutual authentication: both client and server verify each other.

•	Enabling per-user policies and access control.

