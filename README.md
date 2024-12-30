# Round Robin Arbiter

Verilog implementation and testbench for a **Round Robin Arbiter**, a hardware module designed to fairly manage access to shared resources among multiple clients using a cyclic priority scheme.

---

### Features
1. **Round Robin Scheduling:**
   - Ensures cyclic priority for up to 4 clients (`req[3:0]`).
   - Handles simultaneous and individual requests fairly.
   
2. **Finite State Machine (FSM):**
   - Tracks the current grant state and transitions based on active requests.

3. **Reset Support:**
   - Implements asynchronous reset to initialize the arbiter to an idle state.

4. **Testbench:**
   - Provides a comprehensive testbench (`round_robin_tb.v`) for simulation.
   - Verifies functionality under various request scenarios.

5. **Simulation Ready:**
   - Designed for easy testing with waveform analysis via `.vcd` files.

---

### File Structure
- **`round_robin.v`**  
  Verilog implementation of the Round Robin Arbiter.

- **`round_robin_tb.v`**  
  Testbench module for simulating and verifying the functionality of the arbiter.

- **`dump.vcd`**  
  Output waveform file generated during simulation.

---

### Usage

#### 1. Clone the Repository
```bash
git clone <repository-url>
cd <repository-folder>
```

#### 2. Simulate the Design
- Use any Verilog simulator like **Icarus Verilog** to simulate the arbiter:
  ```bash
  iverilog -o round_robin_sim round_robin.v round_robin_tb.v
  vvp round_robin_sim
  ```

#### 3. View Waveforms
- Open the generated `dump.vcd` file with a waveform viewer like **GTKWave**:
  ```bash
  gtkwave dump.vcd
  ```

---

### Testbench Description
The testbench (`round_robin_tb.v`) includes:
- **Clock Signal Generation:** A clock toggling every 5 time units.
- **Reset Behavior Testing:** Asserts and deasserts the reset signal.
- **Various Request Scenarios:** Tests individual, simultaneous, and mixed priority requests.

---

### Example Output
Below is a sample output from the simulation:

| Time (ns) | Request (`req`) | Grant (`grant`) |
|-----------|-----------------|-----------------|
|  0        | `0000`          | `0000`          |
|  10       | `1111`          | `0001`          |
|  20       | `1111`          | `0010`          |
|  30       | `1111`          | `0100`          |
|  40       | `1111`          | `1000`          |
|  50       | `0001`          | `0001`          |

---

### Applications
This arbiter can be used in:
1. **Bus Arbitration:** To fairly allocate access to a shared communication bus.
2. **Memory Access Control:** For managing requests to shared memory among multiple processors.
3. **Resource Allocation:** In systems requiring cyclical scheduling of shared resources.

---

### Contributors
<table>
  <tr>
      <td align="center">
      <a href="https://github.com/MahmoudMagdy404" target="_black">
        <img
          src="https://avatars.githubusercontent.com/u/83336074?v=4"
          width="150px;"
          alt="Mahmoud Magdy"
        />
        <br />
        <sub><b>Mahmoud Magdy</b></sub></a>
       
  </td>
<td align="center">
    <a href="https://github.com/omarnasser0" target="_black">
    <img src="https://avatars.githubusercontent.com/u/100535160?v=4" width="150px;" alt="omarnasser0"/>
    <br />
    <sub><b>Omar Abdulnasser</b></sub></a>

<td align="center">
      <a href="https://github.com/Mahmoudm007" target="_black">
        <img
          src="https://avatars.githubusercontent.com/u/101353088?v=4"
          width="150px;"
          alt="Mahmoud Mohamed"
        />
        <br />
        <sub><b>Mahmoud Mohamed</b></sub></a
      >
    </td>
    <td align="center">
      <a href="https://github.com/ziyad-hf" target="_black">
        <img
          src="https://avatars.githubusercontent.com/u/99608059?v=4"
          width="150px;"
          alt="Ziyad ElFayoumy"
        />
        <br />
        <sub><b>Ziyad ElFayoumy</b></sub></a>
       
  </td>
  </tr>
 </table>
