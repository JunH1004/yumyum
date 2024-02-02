using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;
public class GameManager : MonoBehaviour
{
    public GameObject[] enemies;
    static public int stage = 0;
    public bool isEnemyExist = false;
    static public int gold = 0;

    public TextMeshProUGUI stageText;
    public TextMeshProUGUI goldText;

    public float broGauge = 0;
    public Slider broSlider;
    public GameObject broSliderObj;
    public bool isBroTime = false;

    public GameObject broBoss;
    // Start is called before the first frame update
    void Start()
    {
        isBroTime = false;
        broGauge = 0;
        stage = 0;
        gold = 0;
        StartCoroutine(SpawnEnemyAfterDelay(0));
    }

    // Update is called once per frame
    void Update()
    {
        //ui update
        stageText.text = stage.ToString();
        goldText.text = gold.ToString();
        broSlider.value = broGauge;

        
        if (Input.GetKeyDown(KeyCode.B) && isBroTime == false) {
            broGauge += 0.34f;
        }
        //이거 update에 있는거 맞냐;;;;
        broSliderObj.SetActive(!isBroTime);

        if (broGauge >= 1) {
            broGauge = 0;
            SpawnBro();
        }
    }
    public void SpawnEnemy() {
        if (isEnemyExist) {
            return;
        }
        StartCoroutine(SpawnEnemyAfterDelay(1f));
    }
    public void SpawnBro() {
        if (isBroTime) {
            return;
        }
        isBroTime = true;
        Instantiate(broBoss, transform.position, Quaternion.identity);
    }
    public void GetGold(int g) {
        gold += g;
    }
    IEnumerator SpawnEnemyAfterDelay(float delay)
    {
        stage += 1;
        yield return new WaitForSeconds(delay);
        int index = Random.Range(0, enemies.Length);
        Instantiate(enemies[index], transform.position, Quaternion.identity);
        isEnemyExist = true;
    }
}
